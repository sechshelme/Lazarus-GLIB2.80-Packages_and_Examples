
program project1;

uses
  oglglad_gl,
  oglShader,
  oglGLFW3,
  oglTextur,
  glib2,
  ctypes,
  gst;

var
  pipeline, sink: PGstElement;
  window: PGLFWwindow;
  shader: TShader;
  VBAQuad: TGLint;
  Textur: TTexturBuffer;
  // === OpenGL

const
  VertexShader =
    '#version 330'#10 +
    ''#10 +
    'const vec2 vertices[] = vec2[]('#10 +
    'vec2( -1.0, -1.0),'#10 +
    'vec2( -1.0,  1.0),'#10 +
    'vec2(  1.0,  1.0),'#10 +
    'vec2( -1.0, -1.0),'#10 +
    'vec2(  1.0,  1.0),'#10 +
    'vec2(  1.0, -1.0));'#10 +
    ''#10 +
    'const vec2 texCoord[] = vec2[]('#10 +
    'vec2(  0.0,  1.0),'#10 +
    'vec2(  0.0,  0.0),'#10 +
    'vec2(  1.0,  0.0),'#10 +
    'vec2(  0.0,  1.0),'#10 +
    'vec2(  1.0,  0.0),'#10 +
    'vec2(  1.0,  1.0));'#10 +
    ''#10 +
    'out vec2 UV0;'#10 +
    ''#10 +
    'void main(void) {'#10 +
    ''#10 +
    'gl_Position = vec4(vertices[gl_VertexID], 0.0, 1.0);'#10 +
    'UV0 = texCoord[gl_VertexID];'#10 +
    '}';

  FragmentShader =
    '    #version 330'#10 +
    ''#10 +
    '    uniform sampler2D Sampler;'#10 +
    ''#10 +
    '    in vec2 UV0;'#10 +
    ''#10 +
    '    out vec4 outColor;'#10 +
    ''#10 +
    '    void main(void)'#10 +
    '    {'#10 +
    '       outColor = texture( Sampler, UV0 );'#10 +
    '    }';


  procedure key_callback(window: PGLFWwindow; key: longint; scancode: longint;
    action: longint; mods: longint); cdecl;
  begin
    if (key = GLFW_KEY_ESCAPE) and (action = GLFW_PRESS) then begin
      glfwSetWindowShouldClose(window, GLFW_TRUE);
    end;
  end;

  // https://stackoverflow.com/questions/69747987/gstreamer-rtsp-tee-appsink-cant-emit-signal-new-sample
  // https://www.glfw.org/docs/3.3/quick.html
  // https://github.com/Gauthamraju31/imgui_gstreamer/blob/main/main.cpp

  procedure DrawGL;
  var
    sample: PGstSample;
    buffer: PGstBuffer;
    map: TGstMapInfo;
  begin
    glClear(GL_COLOR_BUFFER_BIT);

    g_signal_emit_by_name(sink, 'pull-sample', @sample);
    buffer := gst_sample_get_buffer(sample);
    gst_buffer_map(buffer, @map, GST_MAP_READ);

    WriteLn('data: ', map.Data[0]);

    Textur.LoadTextures(640, 480, map.Data, GL_RGB, GL_UNSIGNED_BYTE);
    Textur.ActiveAndBind;

    glBindVertexArray(VBAQuad);
    glDrawArrays(GL_TRIANGLES, 0, 6);

    gst_buffer_unmap(buffer, @map);
    //            gst_sample_unref(sample);
  end;



begin
  // === OpenGL

  if glfwInit = 0 then begin
    WriteLn('glfwInit Error !');
    Halt();
  end;

  window := glfwCreateWindow(640, 480, 'Webcam', nil, nil);
  if window = nil then begin
    WriteLn('Konnte Fenster nicht erstellen !');
  end;

  glfwSetKeyCallback(window, @key_callback);

  glfwMakeContextCurrent(window);
  Load_GLADE;
  glfwSwapInterval(1);

  shader := TShader.Create;
  shader.LoadShaderObject(GL_VERTEX_SHADER, VertexShader);
  shader.LoadShaderObject(GL_FRAGMENT_SHADER, FragmentShader);
  shader.LinkProgram;
  shader.UseProgram;

  glGenVertexArrays(1, @VBAQuad);
  glBindVertexArray(0);

  Textur := TTexturBuffer.Create;

  // === GST

  gst_init(@argc, @argv);

  //      pipeline := gst_parse_launch('v4l2src name=cam_src ! videoconvert ! videoscale ! video/x-raw,format=RGB ! queue ! videoconvert ! ximagesink name=img_origin', nil);
  //pipeline := gst_parse_launch('videotestsrc  ! video/x-raw,format=RGB ! queue ! videoconvert ! ximagesink name=sink', nil);
  //  pipeline := gst_parse_launch('videotestsrc ! video/x-raw,format=RGB ! appsink name=sink', nil);
  pipeline := gst_parse_launch('v4l2src name=cam_src ! videoconvert ! videoscale ! video/x-raw,format=RGB ! queue ! videoconvert ! appsink name=sink', nil);
  if pipeline = nil then begin
    WriteLn('pipeline error');
  end;

  sink := gst_bin_get_by_name(GST_BIN(pipeline), 'sink');
  if sink = nil then begin
    WriteLn('sink error');
  end;

  gst_element_set_state(pipeline, GST_STATE_PLAYING);

  while glfwWindowShouldClose(window) = 0 do begin
    DrawGL;
    glfwSwapBuffers(window);
    glfwPollEvents;
  end;
  gst_object_unref(pipeline);

  shader.Free;
  Textur.Free;
end.
