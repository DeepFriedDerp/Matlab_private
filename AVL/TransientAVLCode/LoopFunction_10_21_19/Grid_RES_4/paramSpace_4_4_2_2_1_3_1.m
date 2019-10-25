function [aeroForces] = paramSpace_4_4_2_2_1_3_1(sailStates,airStates)

	CL = (4.718032)*sailStates.alpha + (-0.436776)*sailStates.beta + (-2.129026)*sailStates.p + (35.413876)*sailStates.q + (2.035416)*sailStates.r + (0.011035)*sailStates.de;
	CD = -0.628500;
	CY = (-0.193229)*sailStates.alpha + (-0.023385)*sailStates.beta + (0.753905)*sailStates.p + (-0.455228)*sailStates.q + (-0.149945)*sailStates.r + (-0.000095)*sailStates.de;

	Cl = (1.326208)*sailStates.alpha + (-0.481718)*sailStates.beta + (-0.799696)*sailStates.p + (7.164065)*sailStates.q + (1.631141)*sailStates.r + (-0.000354)*sailStates.de;
	Cm = (-12.191164)*sailStates.alpha + (1.594017)*sailStates.beta + (5.934820)*sailStates.p + (-121.885399)*sailStates.q + (-6.735689)*sailStates.r + (-0.065529)*sailStates.de;
	Cn = (0.751928)*sailStates.alpha + (0.065100)*sailStates.beta + (-1.588148)*sailStates.p + (7.211550)*sailStates.q + (0.023046)*sailStates.r + (0.000245)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end