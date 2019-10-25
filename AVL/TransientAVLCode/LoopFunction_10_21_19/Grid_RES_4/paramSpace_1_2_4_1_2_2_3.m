function [aeroForces] = paramSpace_1_2_4_1_2_2_3(sailStates,airStates)

	CL = (3.576752)*sailStates.alpha + (-0.073828)*sailStates.beta + (-3.333831)*sailStates.p + (42.472683)*sailStates.q + (-1.314422)*sailStates.r + (0.011223)*sailStates.de;
	CD = 0.078320;
	CY = (-0.030121)*sailStates.alpha + (-0.025612)*sailStates.beta + (-0.304883)*sailStates.p + (0.662188)*sailStates.q + (-0.060574)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.340452)*sailStates.alpha + (0.094591)*sailStates.beta + (-1.879069)*sailStates.p + (16.839056)*sailStates.q + (-0.924730)*sailStates.r + (0.001522)*sailStates.de;
	Cm = (-12.860344)*sailStates.alpha + (0.232846)*sailStates.beta + (10.940760)*sailStates.p + (-158.727341)*sailStates.q + (4.368035)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (0.504472)*sailStates.alpha + (0.023573)*sailStates.beta + (0.352576)*sailStates.p + (-0.798359)*sailStates.q + (-0.039874)*sailStates.r + (-0.000260)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end