function [aeroForces] = paramSpace_2_1_3_2_3_1_3(sailStates,airStates)

	CL = (4.638243)*sailStates.alpha + (-0.208070)*sailStates.beta + (-2.966758)*sailStates.p + (37.979282)*sailStates.q + (-1.196844)*sailStates.r + (0.011164)*sailStates.de;
	CD = -0.555260;
	CY = (-0.001196)*sailStates.alpha + (-0.024637)*sailStates.beta + (-0.582724)*sailStates.p + (0.771085)*sailStates.q + (0.000072)*sailStates.r + (0.000167)*sailStates.de;

	Cl = (1.741091)*sailStates.alpha + (0.189725)*sailStates.beta + (-1.580236)*sailStates.p + (13.300278)*sailStates.q + (-1.076104)*sailStates.r + (0.000992)*sailStates.de;
	Cm = (-14.699415)*sailStates.alpha + (0.744186)*sailStates.beta + (10.133630)*sailStates.p + (-147.758499)*sailStates.q + (4.031930)*sailStates.r + (-0.070714)*sailStates.de;
	Cn = (0.112787)*sailStates.alpha + (-0.000413)*sailStates.beta + (1.297364)*sailStates.p + (-6.588402)*sailStates.q + (-0.000290)*sailStates.r + (-0.000357)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end