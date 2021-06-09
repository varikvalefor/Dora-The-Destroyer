GHC = ghc -O2 -threaded
build: Programs/SendJunk.hs Programs/Ten.hs Programs/CrapSum.hs Resource/Bullshit.hs Resource/Mail.hs Resource/PGP.hs ten.1 crapsum.1 sendjunk.1
	ghc -O2 -package random dtd.hs
	-rm *.hi *.o Resource/*[!s]
	-rm ten sendjunk crapsum256 crapsum512
	ln -s dtd ten
	ln -s dtd sendjunk
	ln -s dtd crapsum256
	ln -s dtd crapsum512
