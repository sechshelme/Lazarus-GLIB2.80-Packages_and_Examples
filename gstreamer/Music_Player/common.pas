unit Common;

interface

const
  MusicDir: string = '';
  //  CFTime = 13 * 1000; // 3s
  CFTime = 00; // 3s
  FITime = 3 * 1000;

type
  Tcommand = (cmNone, cmNew, cmSave, cmOpen, cmClose, cmAdd, cmRemove, cmRemoveAll, cmUp, cmDown, cmPlay, cmPause, cmStop, cmNext, cmPrev);

  TcmdProp = record
    cmd: Tcommand;
    Caption: string;
    IconPath: string;
  end;
  TcmdProps = array of TcmdProp;

  // /home/tux/fpcupdeluxe_trunk/lazarus/images/general_purpose

const
  FileCmdProb: TcmdProps = (
    (cmd: cmNew; Caption: 'Neu'),
    (cmd: cmNone; Caption: '-'),
    (cmd: cmSave; Caption: 'Speichern'),
    (cmd: cmOpen; Caption: 'Öffnen'),
    (cmd: cmNone; Caption: '-'),
    (cmd: cmClose; Caption: 'Beenden'));

  EditCmdProb: TcmdProps = (
    (cmd: cmAdd; Caption: 'Add'),
    (cmd: cmRemove; Caption: 'Remove'),
    (cmd: cmRemoveAll; Caption: 'Remove All'),
    (cmd: cmUp; Caption: 'Up'),
    (cmd: cmDown; Caption: 'Down'));
  //▶️⏸⏯⏹⏺⏭⏮⏩⏪

  PlayCmdProp: TcmdProps = (
    (cmd: cmPlay; Caption: 'Play️'; IconPath: 'Play_01_64'),
    (cmd: cmPause; Caption: 'Pause️'; IconPath: 'Pause_01_64'),
    (cmd: cmStop; Caption: 'Stop'; IconPath: 'Stop_01_64'),
    (cmd: cmNext; Caption: 'Next️'; IconPath: 'Forward_02_64'),
    (cmd: cmPrev; Caption: 'Prev'; IconPath: 'Backward_02_64'));

implementation

end.
