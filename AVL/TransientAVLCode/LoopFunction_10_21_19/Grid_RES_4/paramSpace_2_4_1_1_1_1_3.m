function [aeroForces] = paramSpace_2_4_1_1_1_1_3(sailStates,airStates)

	CL = (5.171556)*sailStates.alpha + (0.574889)*sailStates.beta + (-3.506350)*sailStates.p + (44.461445)*sailStates.q + (-2.242056)*sailStates.r + (0.011829)*sailStates.de;
	CD = -1.855780;
	CY = (-0.525388)*sailStates.alpha + (-0.026822)*sailStates.beta + (-0.909786)*sailStates.p + (-1.471503)*sailStates.q + (-0.059475)*sailStates.r + (-0.000320)*sailStates.de;

	Cl = (1.183377)*sailStates.alpha + (0.660313)*sailStates.beta + (-1.901435)*sailStates.p + (16.487856)*sailStates.q + (-2.073043)*sailStates.r + (0.001423)*sailStates.de;
	Cm = (-11.065222)*sailStates.alpha + (-2.336330)*sailStates.beta + (11.338324)*sailStates.p + (-161.242615)*sailStates.q + (7.654624)*sailStates.r + (-0.071759)*sailStates.de;
	Cn = (1.338567)*sailStates.alpha + (0.033497)*sailStates.beta + (1.959376)*sailStates.p + (-7.255286)*sailStates.q + (0.000108)*sailStates.r + (0.000245)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end