GHC = ghc -O2 -threaded
build: sendjunk.hs sendjunk.1 Resource/Mail.hs Resource/PGP.hs Resource/Bullshit.hs ten.hs ten.1
	$(GHC) ten
	$(GHC) sendjunk
	rm *.hi *.o Resource/*[!s]
