s/\\($0008\\)/(BusErrVecAddr)/g
s/\\($0010\\)/(ImproperOrderVecAddr)/g
s/\\($0020\\)/(PrivilegeViolationVecAddr)/g
s/\\($002c\\)/(LineFVec)/g
s/\\($007c\\)/(Level7IntVecAddr)/g
s/\\($00a8\\)/(Trap10VecAddr)/g
s/\\($00ac\\)/(Trap11VecAddr)/g
s/\\($00b8\\)/(Trap14VecAddr)/g
s/\\($00e80029\\)/CRTMemoryModeLSB/g
s/\\($00e82200\\)/VideoPalette/g
s/\\($00e840c0\\)/DMACChan3CSR/g
s/\\($00e840c5\\)/DMACChan3OCR/g
s/\\($00e840c7\\)/DMACChan3CCR/g
s/\\($00e840ca\\)/DMACChan3MTC/g
s/\\($00e840cc\\)/DMACChan3MAR/g
s/\\($00e86001\\)/AreaSetReg/g
s/\\($00e88001\\)/MFPGPIP/g
s/\\($00e8e001\\)/SysPort1/g
s/\\($00e8e007\\)/SysPort4/g
s/\\($00e90001\\)/OPMReg/g
s/\\($00e90003\\)/OPMData/g
s/\\($00e92001\\)/ADPCMStatus/g
s/\\($00e92003\\)/ADPCMData/g
s/\\($00e94005\\)/FDCStatusOption/g
s/\\($00e9a005\\)/I8255PortC/g
s/\\($0160\\)/(SCCTxBufferEmptyVecAddr)/g
s/\\($07fc\\)/(IOCSAbortFuncAddr)/g
s/\\($0c90\\)/(FD0ResultStatusRxBuf)/g
s/\\($0cbc\\)/(IOCSWorkMPUType)/g
s/\\($1800\\)/(DOSCallVecTable)/g
s/\\($1bc0\\)/(DOSCallAddr_EXITVC)/g
s/\\($1bc4\\)/(DOSCallAddr_CTRLVC)/g
s/\\($1bc8\\)/(DOSCallAddr_ERRJVC)/g
s/\\($1be0\\)/(DOSCallAddr_OPEN_PR)/g
s/\\($1be4\\)/(DOSCallAddr_KILL_PR)/g
s/\\($1bfc\\)/(DOSCallAddr_CHANGE_PR)/g
s/\\($1c00\\)/(DOSWorkCurProcEndAddr)/g
s/\\($1c04\\)/(DOSWorkCurProcStartAddr)/g
s/\\($1c08\\)/(DOSWorkRecursionCount)/g
s/\\($1c0a\\)/(DOSWorkCurrentCallNum)/g
s/\\($1c0b\\)/(DOSWorkNewfatSetting)/g
s/\\($1c0c\\)/(DOSWork_IOCTRLArg1_Retries)/g
s/\\($1c0e\\)/(DOSWork_IOCTRLArg2_WaitTime)/g
s/\\($1c10\\)/(DOSWorkVerifyMode)/g
s/\\($1c12\\)/(DOSWorkBreakMode)/g
s/\\($1c13\\)/(DOSWorkCTRLPFlag)/g
s/\\($1c14\\)/(DOSWorkThreadSwitchReqFlag)/g
s/\\($1c15\\)/(DOSWorkCurDriveNum)/g
s/\\($1c16\\)/(DOSWorkStopKeyFlag)/g
s/\\($1c17\\)/(DOSWorkTrap10ExecFlag)/g
s/\\($1c18\\)/(DOSWorkTrap10d0)/g
s/\\($1c1c\\)/(DOSWorkLastDeviceDrvHeaderAddr)/g
s/\\($1c20\\)/(DOSWorkHuman68kPDB)/g
s/\\($1c24\\)/(DOSWorkHuman68kEndAddr)/g
s/\\($1c28\\)/(DOSWorkCurProcPtrAddr)/g
s/\\($1c2c\\)/(DOSWorkFCBIdxTblAddr)/g
s/\\($1c30\\)/(DOSWorkFCBTblAddr)/g
s/\\($1c34\\)/(DOSWorkDiskIOBufAddr)/g
s/\\($1c38\\)/(DOSWorkCurDirTblAddr)/g
s/\\($1c3c\\)/(DOSWorkDPBTblAddr)/g
s/\\($1c40\\)/(DOSWorkShareManStructAddr)/g
s/\\($1c44\\)/(DOSWorkCommonAreaAddr)/g
s/\\($1c48\\)/(DOSWorkCommonAreaEndAddr)/g
s/\\($1c4c\\)/(DOSWorkCommonAddrEndAddr)/g
s/\\($1c50\\)/(DOSWorkThreadManStructTblddr)/g
s/\\($1c54\\)/(DOSWorkCurThreadManStructAddr)/g
s/\\($1c58\\)/(DOSWorkMaxThreads)/g
s/\\($1c5a\\)/(DOSWorkCurGeneratedThreadsNum)/g
s/\\($1c5c\\)/(DOSWorkPrevSSPVal)/g
s/\\($1c60\\)/(DOSWorkAbortSR)/g
s/\\($1c62\\)/(DOSWorkAbortSSP)/g
s/\\($1c66\\)/(DOSWorkTrap11PreviousAddr)/g
s/\\($1c6a\\)/(DOSWorkTrap10PreviousAddr)/g
s/\\($1c6e\\)/(DOSWorkMaxFileHandle)/g
s/\\($1c70\\)/(DOSWorkBuffersArg2)/g
s/\\($1c72\\)/(DOSWorkBuffersArg2)/g
s/\\($1c73\\)/(DOSWorkLastdriveSetting)/g
s/\\($1c74\\)/(DOSWorkMaxDries)/g
s/\\($1c75\\)/(DOSWorkConnectedDrivesNum)/g
s/\\($1c76\\)/(DOSWorkShareArg2)/g
s/\\($1c78\\)/(DOSWorkShareArg1)/g
s/\\($1c7a\\)/(DOSWorkShareBytesPerStruct)/g
s/\\($1c7e\\)/(DOSWorkDrvReplacementTbl)/g
s/\\($1c98\\)/(DOSWorkFCBOpened)/g
s/\\($1c9c\\)/(DOSWorkFCBFileHandle)/g
s/\\($1ca0\\)/(DOSWork_EXECState)/g
s/\\($1ca1\\)/(DOSWork_EXECModuleNum)/g
s/\\($1ca2\\)/(DOSWorkInsKeyMode)/g
s/\\($1ca3\\)/(DOSWorkErrExecFlag)/g
s/\\($1ca4\\)/(DOSWorkReadRow)/g
s/\\($1ca8\\)/(DOSWorkReadRemainingBytes)/g
s/\\($1caa\\)/(DOSWork_EXECCurPDBAddr)/g
s/\\($1cae\\)/(DOSWorkProcessExitCode)/g
s/\\($1cb2\\)/(DOSWork_EXECCmdlineAddr)/g
s/\\($1cb6\\)/(DOSWorkClockDeviceHeader)/g
s/\\($1cba\\)/(DOSWorkFflushMode)/g
s/\\($1cbc\\)/(DOSWorkBreakKeyCode)/g
s/\\($1cbe\\)/(DOSWorkDisablePrnCode)/g
s/\\($1cc0\\)/(DOSWorkEnablePrnCode)/g
s/\\($1cc2\\)/(DOSWorkResumeScroll)/g
s/\\($1cc4\\)/(DOSWorkStopScroll)/g
