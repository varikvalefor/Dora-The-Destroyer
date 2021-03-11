GHC = ghc -O2 -threaded
build: crapsum.hs crapsum.1 sendjunk.hs sendjunk.1 Resource/Mail.hs Resource/PGP.hs Resource/Bullshit.hs ten.hs ten.1
	$(GHC) ten
	$(GHC) sendjunk
	$(GHC) crapsum
	rm *.hi *.o Resource/*[!s]
