function [aeroForces] = paramSpace_2_3_1_3_1_3_3(sailStates,airStates)

	CL = (4.215180)*sailStates.alpha + (-0.021204)*sailStates.beta + (-2.814481)*sailStates.p + (36.294022)*sailStates.q + (0.401268)*sailStates.r + (0.010966)*sailStates.de;
	CD = -0.167790;
	CY = (-0.022728)*sailStates.alpha + (-0.025176)*sailStates.beta + (0.280127)*sailStates.p + (-0.432842)*sailStates.q + (0.018406)*sailStates.r + (-0.000094)*sailStates.de;

	Cl = (1.418396)*sailStates.alpha + (-0.130832)*sailStates.beta + (-1.401840)*sailStates.p + (11.343612)*sailStates.q + (0.425012)*sailStates.r + (0.000656)*sailStates.de;
	Cm = (-14.867166)*sailStates.alpha + (0.061085)*sailStates.beta + (9.822287)*sailStates.p + (-144.575439)*sailStates.q + (-1.321482)*sailStates.r + (-0.070833)*sailStates.de;
	Cn = (0.123551)*sailStates.alpha + (-0.007191)*sailStates.beta + (-0.713777)*sailStates.p + (3.983898)*sailStates.q + (-0.013221)*sailStates.r + (0.000207)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end