function [aeroForces] = paramSpace_4_4_4_1_2_2_3(sailStates,airStates)

	CL = (3.398812)*sailStates.alpha + (-0.282438)*sailStates.beta + (-3.312099)*sailStates.p + (42.351673)*sailStates.q + (1.336309)*sailStates.r + (0.010787)*sailStates.de;
	CD = 0.113800;
	CY = (0.046800)*sailStates.alpha + (-0.022472)*sailStates.beta + (0.347083)*sailStates.p + (-0.662187)*sailStates.q + (-0.069110)*sailStates.r + (-0.000141)*sailStates.de;

	Cl = (1.243091)*sailStates.alpha + (-0.242178)*sailStates.beta + (-1.805962)*sailStates.p + (15.977765)*sailStates.q + (0.979540)*sailStates.r + (0.001335)*sailStates.de;
	Cm = (-12.054276)*sailStates.alpha + (1.094572)*sailStates.beta + (10.844463)*sailStates.p + (-157.701080)*sailStates.q + (-4.514272)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (-0.514458)*sailStates.alpha + (0.033188)*sailStates.beta + (-0.428940)*sailStates.p + (0.983639)*sailStates.q + (-0.038241)*sailStates.r + (0.000212)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end