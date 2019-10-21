function [aeroForces] = paramSpace_1_2_1_1_1_1_2(sailStates,airStates)

	CL = (4.746843)*sailStates.alpha + (-0.694691)*sailStates.beta + (-5.844472)*sailStates.p + (54.477379)*sailStates.q + (2.148673)*sailStates.r + (0.011010)*sailStates.de;
	CD = -6.599330;
	CY = (2.322934)*sailStates.alpha + (-0.018129)*sailStates.beta + (1.249466)*sailStates.p + (3.894178)*sailStates.q + (0.165047)*sailStates.r + (0.000881)*sailStates.de;

	Cl = (-1.014606)*sailStates.alpha + (-0.897251)*sailStates.beta + (-3.976219)*sailStates.p + (34.183998)*sailStates.q + (2.370325)*sailStates.r + (0.005114)*sailStates.de;
	Cm = (4.372221)*sailStates.alpha + (2.956766)*sailStates.beta + (21.736082)*sailStates.p + (-232.616364)*sailStates.q + (-7.295387)*sailStates.r + (-0.081293)*sailStates.de;
	Cn = (-8.540596)*sailStates.alpha + (-0.090611)*sailStates.beta + (-3.425526)*sailStates.p + (14.655998)*sailStates.q + (-0.071660)*sailStates.r + (-0.000735)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end