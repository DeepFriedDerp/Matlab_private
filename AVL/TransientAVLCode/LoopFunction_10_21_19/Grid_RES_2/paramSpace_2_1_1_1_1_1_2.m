function [aeroForces] = paramSpace_2_1_1_1_1_1_2(sailStates,airStates)

	CL = (4.298521)*sailStates.alpha + (-0.086623)*sailStates.beta + (-2.944767)*sailStates.p + (36.155891)*sailStates.q + (-0.251001)*sailStates.r + (0.010521)*sailStates.de;
	CD = -0.490570;
	CY = (-0.204828)*sailStates.alpha + (-0.026476)*sailStates.beta + (-0.270051)*sailStates.p + (-1.226113)*sailStates.q + (0.035640)*sailStates.r + (-0.000264)*sailStates.de;

	Cl = (1.390993)*sailStates.alpha + (0.175002)*sailStates.beta + (-1.598861)*sailStates.p + (13.304145)*sailStates.q + (-0.452393)*sailStates.r + (0.001049)*sailStates.de;
	Cm = (-14.715616)*sailStates.alpha + (0.415396)*sailStates.beta + (10.523985)*sailStates.p + (-148.931046)*sailStates.q + (0.860735)*sailStates.r + (-0.070142)*sailStates.de;
	Cn = (0.140518)*sailStates.alpha + (-0.026264)*sailStates.beta + (0.826250)*sailStates.p + (-3.485114)*sailStates.q + (-0.021806)*sailStates.r + (0.000290)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end