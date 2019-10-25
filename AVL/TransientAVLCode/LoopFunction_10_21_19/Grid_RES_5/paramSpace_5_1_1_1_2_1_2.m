function [aeroForces] = paramSpace_5_1_1_1_2_1_2(sailStates,airStates)

	CL = (5.226133)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.095568)*sailStates.p + (41.786469)*sailStates.q + (-2.191947)*sailStates.r + (0.011657)*sailStates.de;
	CD = -1.027550;
	CY = (-0.041045)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.936438)*sailStates.p + (1.178226)*sailStates.q + (-0.098548)*sailStates.r + (0.000256)*sailStates.de;

	Cl = (2.010438)*sailStates.alpha + (0.420763)*sailStates.beta + (-1.621337)*sailStates.p + (14.367564)*sailStates.q + (-1.896314)*sailStates.r + (0.000982)*sailStates.de;
	Cm = (-13.715013)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.688112)*sailStates.p + (-150.099487)*sailStates.q + (7.411704)*sailStates.r + (-0.071133)*sailStates.de;
	Cn = (0.477500)*sailStates.alpha + (0.044224)*sailStates.beta + (1.903563)*sailStates.p + (-8.790405)*sailStates.q + (0.018522)*sailStates.r + (-0.000493)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end