function [aeroForces] = paramSpace_4_1_3_3_1_1_2(sailStates,airStates)

	CL = (3.850536)*sailStates.alpha + (0.078318)*sailStates.beta + (-2.396569)*sailStates.p + (32.789062)*sailStates.q + (0.447070)*sailStates.r + (0.009970)*sailStates.de;
	CD = -0.028450;
	CY = (-0.059447)*sailStates.alpha + (-0.026395)*sailStates.beta + (0.001916)*sailStates.p + (-0.489619)*sailStates.q + (-0.000399)*sailStates.r + (-0.000103)*sailStates.de;

	Cl = (1.249576)*sailStates.alpha + (0.048931)*sailStates.beta + (-1.176462)*sailStates.p + (9.836996)*sailStates.q + (0.182842)*sailStates.r + (0.000422)*sailStates.de;
	Cm = (-14.175447)*sailStates.alpha + (-0.271770)*sailStates.beta + (8.369271)*sailStates.p + (-133.122253)*sailStates.q + (-1.543856)*sailStates.r + (-0.066591)*sailStates.de;
	Cn = (-0.163222)*sailStates.alpha + (-0.007896)*sailStates.beta + (0.217868)*sailStates.p + (-1.414564)*sailStates.q + (-0.033149)*sailStates.r + (0.000113)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end