function [aeroForces] = paramSpace_4_3_4_3_3_3_3(sailStates,airStates)

	CL = (3.959559)*sailStates.alpha + (-0.129304)*sailStates.beta + (-2.794015)*sailStates.p + (39.740879)*sailStates.q + (1.636615)*sailStates.r + (0.011094)*sailStates.de;
	CD = -0.114050;
	CY = (0.095079)*sailStates.alpha + (-0.025320)*sailStates.beta + (0.499699)*sailStates.p + (0.294837)*sailStates.q + (-0.099365)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.249208)*sailStates.alpha + (-0.297728)*sailStates.beta + (-1.377318)*sailStates.p + (12.282808)*sailStates.q + (1.302719)*sailStates.r + (0.000656)*sailStates.de;
	Cm = (-12.280979)*sailStates.alpha + (0.506884)*sailStates.beta + (8.700897)*sailStates.p + (-142.570129)*sailStates.q + (-5.495942)*sailStates.r + (-0.068480)*sailStates.de;
	Cn = (-0.307042)*sailStates.alpha + (0.052935)*sailStates.beta + (-0.893583)*sailStates.p + (2.765709)*sailStates.q + (-0.027239)*sailStates.r + (-0.000021)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end