#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: hwBoxDellXps8900.sh,v 1.1 2020-05-10 01:46:03 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/opt/public/osmt/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /opt/public/osmt/bin/hwBoxXps8900.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /opt/public/osmt/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_

_CommentBegin_
*      ================
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
*  [[elisp:(org-cycle)][| ]]  Notes         :: *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  March 2016   ::  Costco 16gig + 2tb \$799    [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Ram Specification      ::  Dual Chanel DDR4 2133 about \$130 (201604) for 2x8=16 gig sticks   [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  SSD Card      ::  201604  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Bios Setup      ::  Description   [[elisp:(org-cycle)][| ]]
*** Disable Legacy, Enable Secure Efi
**  [[elisp:(org-cycle)][| ]]  Instructions Pointers      ::  On The Web   [[elisp:(org-cycle)][| ]]
http://www.dell.com/support/article/us/en/04/SLN297060/en

Re: Black Screen on Install (15.04 & 15.10) Dell XPS 8900
**  [[elisp:(org-cycle)][| ]]  Installation Instructions      ::  Ubuntu 16.04   [[elisp:(org-cycle)][| ]]
*** BIOS
    F2 
    UEFI On -- Security Enabled
*** Boot From USB -- F12
    1) After placing the 15.10 DVD/pen-drive, change the boot order
       (press F2 or F12 after restart --> boot sequence --> bring the
       DVD/pen-drive to the first among the others) such that it will
       read the DVD/pen-drive first and press enter.
**** In UEFI -- After Linux Boots at Ubuntu Prompt
     e for edit
     3rd line edit
     write "pcie_aspm=off"
       before "---" and after "quiet splash".
     F10 to boot
**** In Legacy (Non UEFI)
    2) Once the system starts booting, press SHIFT key to enter into
       the ubuntu 15.10 live CD grub menu (if you not pressing the
       shift menu, you will get a blank screen).
    3) In the grub menu, I saw four options where the first one is
       "Try to install ubuntu" (this will be highlighted
       automatically). Below these options you will see some
       description regarding function keys. Among them, press F6 and
       select (press Enter) the first one (similar to pressing 'e' in
       the Archcynic's post). After selecting the first one, press
       Esc. This will give you a single line of commands (above
       function keys) and here you need to write "pcie_aspm=off"
       before "---" and after "quiet splash". After this, press Enter
       to start the installation (This is similar to F10 in
       Archcynic's post). You will be taken directly to the ubuntu
       15.10 desktop and here you will have an option to install.
*** Start Ubuntu Installation
*** Where To Install -- Something Else (Custom Install)
**** Partictions
     BX: Make sure there is efi partition in the begining.
     Something like
     sdc1 /boot/efi  100MB
     sdc2 /          100G EXT4
     sdc3 /swap      16384MB    
**** Make sure it is marked as boot from sdc1 (Linux /boot/efi partition)
*** Exit Reboot-Now Option
*** Edit /etc/default/grub
    4) After you complete your installation, you can mount your hard
       disk (simply by double clicking on the hard-disk) and go to the
       /media/ubuntu/<somenumber/etc/default/grub file.
    Get a Terminal
    BX: mount /dev/sdc2 /mnt
    BX: apt-get install emacs
    Edit this file as archcynic suggested with:
    GRUB_CMDLINE_LINUX_DEFAULT="quiet splash pcie_aspm=off" and edit the line
*** Edit /boot/grub/grub.cfg
    5) copy and paste the above command in the grub.cfg file located
       at /media/ubuntu/<somenumber>/boot/grub/ (if you don't have
       one, just create a grub folder inside the /boot of your
       hard-disk and create a grub.cfg file. I have copied the
       /boot/grub/grub.cfg file located on the live CD to
       /media/ubuntu/<somenumber>/boot/grub/ and edited it). This is
       very important if you are NOT making your system dual boot
       (i.e. a plain ubuntu installation). Changing the grub.cfg file
       allows you to log-in your system after a system restart.
    s/$vt_handoff/$vt_handoff pcie_aspm=off

    There will be 3 occurences.
*** update-grub" (after system restart)
    6) Final step is to run "sudo update-grub" (after system restart).
*** nvidia-352 (Perhaps)
    7) As mentioned in the above posts "sudo apt-get install nvidia-352" helped me to resolve the text breaks on the screen.
_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh


# PRE parameters

baseDir=""

function G_postParamHook {
     return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Chapter Title" )
$( examplesSeperatorSection "Section Title" )
${G_myName} ${extraInfo} -i moduleDescription
_EOF_
}

noArgsHook() {
  vis_examples
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_doTheWork {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo vis_failExample
    EH_retOnFail

    lpReturn
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *End Of Editable Text*
_CommentEnd_

####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common        ::  /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
