function [aeroForces] = paramSpace_1_3_2_1_1_1_1(sailStates,airStates)

	CL = (5.322925)*sailStates.alpha + (0.211412)*sailStates.beta + (-1.846767)*sailStates.p + (35.699379)*sailStates.q + (-2.473201)*sailStates.r + (0.011763)*sailStates.de;
	CD = -1.815460;
	CY = (0.009005)*sailStates.alpha + (-0.027531)*sailStates.beta + (-0.891119)*sailStates.p + (-2.326707)*sailStates.q + (-0.177171)*sailStates.r + (-0.000486)*sailStates.de;

	Cl = (0.518888)*sailStates.alpha + (0.587427)*sailStates.beta + (-0.531980)*sailStates.p + (4.979931)*sailStates.q + (-2.143607)*sailStates.r + (-0.000710)*sailStates.de;
	Cm = (-8.437678)*sailStates.alpha + (-0.818859)*sailStates.beta + (4.512698)*sailStates.p + (-113.341965)*sailStates.q + (8.221646)*sailStates.r + (-0.065707)*sailStates.de;
	Cn = (-1.432685)*sailStates.alpha + (0.106628)*sailStates.beta + (2.032073)*sailStates.p + (-7.293732)*sailStates.q + (-0.001322)*sailStates.r + (0.000521)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end