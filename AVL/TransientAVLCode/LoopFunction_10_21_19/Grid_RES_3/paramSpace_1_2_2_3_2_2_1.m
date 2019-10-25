function [aeroForces] = paramSpace_1_2_2_3_2_2_1(sailStates,airStates)

	CL = (3.906665)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.249805)*sailStates.p + (33.112137)*sailStates.q + (-0.790601)*sailStates.r + (0.010629)*sailStates.de;
	CD = 0.055250;
	CY = (-0.002976)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.170653)*sailStates.p + (-0.173374)*sailStates.q + (-0.030091)*sailStates.r + (-0.000037)*sailStates.de;

	Cl = (1.083406)*sailStates.alpha + (0.092242)*sailStates.beta + (-0.967317)*sailStates.p + (7.908496)*sailStates.q + (-0.530856)*sailStates.r + (0.000003)*sailStates.de;
	Cm = (-13.898922)*sailStates.alpha + (0.000000)*sailStates.beta + (7.492967)*sailStates.p + (-128.476028)*sailStates.q + (2.665050)*sailStates.r + (-0.067684)*sailStates.de;
	Cn = (0.026932)*sailStates.alpha + (0.016265)*sailStates.beta + (0.252879)*sailStates.p + (-0.563494)*sailStates.q + (-0.018940)*sailStates.r + (0.000032)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end