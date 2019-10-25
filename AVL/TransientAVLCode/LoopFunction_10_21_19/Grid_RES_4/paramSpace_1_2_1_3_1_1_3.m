function [aeroForces] = paramSpace_1_2_1_3_1_1_3(sailStates,airStates)

	CL = (3.959559)*sailStates.alpha + (-0.129304)*sailStates.beta + (-2.794016)*sailStates.p + (39.740879)*sailStates.q + (-1.636615)*sailStates.r + (0.011094)*sailStates.de;
	CD = -0.114050;
	CY = (-0.095079)*sailStates.alpha + (-0.024632)*sailStates.beta + (-0.499699)*sailStates.p + (-0.294837)*sailStates.q + (-0.099365)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.289361)*sailStates.alpha + (0.224428)*sailStates.beta + (-1.408851)*sailStates.p + (12.679771)*sailStates.q + (-1.309033)*sailStates.r + (0.000742)*sailStates.de;
	Cm = (-12.280977)*sailStates.alpha + (0.506884)*sailStates.beta + (8.700897)*sailStates.p + (-142.570129)*sailStates.q + (5.495943)*sailStates.r + (-0.068480)*sailStates.de;
	Cn = (0.338750)*sailStates.alpha + (0.050929)*sailStates.beta + (0.887311)*sailStates.p + (-2.686748)*sailStates.q + (-0.028495)*sailStates.r + (0.000021)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end