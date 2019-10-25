function [aeroForces] = paramSpace_2_2_1_1_1_1_2(sailStates,airStates)

	CL = (4.298521)*sailStates.alpha + (0.086623)*sailStates.beta + (-2.944766)*sailStates.p + (36.155899)*sailStates.q + (-0.251001)*sailStates.r + (0.010521)*sailStates.de;
	CD = -0.490570;
	CY = (-0.204828)*sailStates.alpha + (-0.023333)*sailStates.beta + (-0.270051)*sailStates.p + (-1.226113)*sailStates.q + (0.035640)*sailStates.r + (-0.000264)*sailStates.de;

	Cl = (1.300324)*sailStates.alpha + (0.193163)*sailStates.beta + (-1.534455)*sailStates.p + (12.502340)*sailStates.q + (-0.460815)*sailStates.r + (0.000875)*sailStates.de;
	Cm = (-14.715616)*sailStates.alpha + (-0.415396)*sailStates.beta + (10.523987)*sailStates.p + (-148.931046)*sailStates.q + (0.860736)*sailStates.r + (-0.070142)*sailStates.de;
	Cn = (0.119778)*sailStates.alpha + (-0.022206)*sailStates.beta + (0.817771)*sailStates.p + (-3.379555)*sailStates.q + (-0.020697)*sailStates.r + (0.000290)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end