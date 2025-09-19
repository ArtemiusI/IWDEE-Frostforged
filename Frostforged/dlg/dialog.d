CHAIN IF WEIGHT #-1 ~Global("C0FrostforgedHrothAxe","GLOBAL",1)~ THEN DHERMIT DHERMIT-0
~Hang on a minute, there's something half-buried in the snow here... ah, does this axe look familiar to you?~
END
  ++ ~I recognize that axe... it belonged to Hrothgar.~ DO ~GiveItemCreate("C0FF-AX1",LastTalkedToBy,1,1,0)~ EXTERN DHERMIT DHERMIT-1
  ++ ~No, it's not any of ours.~ DO ~GiveItemCreate("C0FF-AX1",LastTalkedToBy,1,1,0)~ EXTERN DHERMIT DHERMIT-2
  ++ ~I don't think so, but I'll take it anyways.~ DO ~GiveItemCreate("C0FF-AX1",LastTalkedToBy,1,1,0)~ EXTERN DHERMIT DHERMIT-3

CHAIN DHERMIT DHERMIT-1
~So it belonged to a friend of yours, I assume. Take it, then.~
EXTERN DHERMIT DHERMIT-3

CHAIN DHERMIT DHERMIT-2
~Well, I haven't got any use for it. You may as well take it.~
EXTERN DHERMIT DHERMIT-3

CHAIN DHERMIT DHERMIT-3
~From the looks of things, you'll need all the help that you can get.~
DO ~SetGlobal("C0FrostforgedHrothAxe","GLOBAL",2)~ EXIT

EXTEND_BOTTOM DCONLAN 17 #5
+ ~Global("C0JorilsDaggerUpgrade","MYAREA",0)
PartyHasItem("C0FF-MS1")~ + ~I have a giant's enchanted dagger here. Do you think you could reforge it into a sword?~ DO ~SetGlobal("Conlan_Thanked","GLOBAL",1)
SetGlobal("Know_Conlan","GLOBAL",2)
SetGlobal("C0JorilsDaggerUpgrade","MYAREA",1)~ EXTERN DCONLAN CONLAN-JORILS
+ ~Global("C0JorilsDaggerUpgrade","MYAREA",1)
PartyHasItem("C0FF-MS1")~ + ~What did you say you could do with this giant's dagger?~ DO ~SetGlobal("Conlan_Thanked","GLOBAL",1)
SetGlobal("Know_Conlan","GLOBAL",2)~ EXTERN DCONLAN CONLAN-JORILS
END

EXTEND_BOTTOM DCONLAN 0 1 13 14 44 #5
+ ~Global("C0JorilsDaggerUpgrade","MYAREA",0)
PartyHasItem("C0FF-MS1")~ + ~I have a giant's enchanted dagger here. Do you think you could reforge it into a sword?~ DO ~SetGlobal("C0JorilsDaggerUpgrade","MYAREA",1)~ EXTERN DCONLAN CONLAN-JORILS
+ ~Global("C0JorilsDaggerUpgrade","MYAREA",1)
PartyHasItem("C0FF-MS1")~ + ~What did you say you could do with this giant's dagger?~ EXTERN DCONLAN CONLAN-JORILS
END

CHAIN DCONLAN CONLAN-JORILS
~This... is a dagger? Now that I'm taking a closer look at it, I can see it, but from a glance it appeared like a crude greatsword.~
= ~In fact, turning it into an actual two-handed sword wouldn't take too long at all. I reckon I can even make sure it holds most of its magic in the process.~
= ~It'll only take a day to finish. 4000 gold should cover the costs.~
END
++ ~That's more than reasonable. I'll be back in a day.~ DO ~TakePartyItem("C0FF-MS1")
DestroyItem("C0FF-MS1")
TakePartyGold(4000)
SetGlobal("C0JorilsDaggerUpgrade","MYAREA",2)
SetGlobalTimer("C0JorilsDaggerUpgradeTimer","MYAREA",ONE_DAY)~ EXTERN DCONLAN CONLAN-JORILS-1
++ ~I don't have that much gold on me at the moment. Maybe another time.~ EXTERN DCONLAN 37
++ ~Actually, I've changed my mind. I'll hold onto this for now.~ EXTERN DCONLAN 38

CHAIN DCONLAN CONLAN-JORILS-1
~Alright. It'll be done and ready by tomorrow.~
EXTERN DCONLAN 44

CHAIN IF WEIGHT #-1 ~Global("C0JorilsDaggerUpgrade","MYAREA",2)
GlobalTimerExpired("C0JorilsDaggerUpgradeTimer","MYAREA")
Global("Kuldahar_Murder","GLOBAL",0)
OR(2)
!GlobalGT("Sheemish_Escape","GLOBAL",1)
!Global("Conlan_Thanked","GLOBAL",0)~ THEN DCONLAN DCONLAN-JORILS-DONE
~Welcome back. The greatsword... formerly giant's dagger, has been reforged.~
= ~It's still a little rough by design, but I didn't dare to get too creative in case it lost its magic. It shouldn't feel any worse in battle, at least.~
= ~Here, it's all yours. Use it to cut down a few monsters for me, would you?~
DO ~SetGlobal("C0JorilsDaggerUpgrade","MYAREA",3)
GiveItemCreate("C0FF-2H1",LastTalkedToBy,0,0,0)~ EXTERN DCONLAN 44

EXTEND_BOTTOM DTIERNON 33 46 78 #6
+ ~PartyHasItem("C0FF-AX1")~ + ~I have an axe here, which belonged to a fallen comrade... do you think you could improve it?~ DO ~SetGlobal("C0HrothgarsAxeUpgrade","GLOBAL",1)~ EXTERN DTIERNON TIERNON-HROTHGARS
END

CHAIN DTIERNON TIERNON-HROTHGARS
~Aye, 'twould be simple enough... an old thing, this be, but taken good care of. With just a little bit o' time, I could awaken some o' its old power...~
DO ~StartCutSceneMode()
StartCutScene("C0FF-AXC")~ EXIT

CHAIN IF WEIGHT #-1 ~Global("C0TiernonHrothgarsAxeUpgrade","GLOBAL",1)~ THEN DTIERNON TIERNON-HROTHGARS-DONE
~Aye, it be done. A weapon fit for a hero, this one. Take as good care o' it as its previous owner did.~
END
++ ~I will. Thank you, Tiernon.~ DO ~SetGlobal("C0TiernonHrothgarsAxeUpgrade","GLOBAL",2)~ EXTERN DTIERNON 78
++ ~I'll be sure not to die the same way, at least.~ DO ~SetGlobal("C0TiernonHrothgarsAxeUpgrade","GLOBAL",2)~ EXTERN DTIERNON 78