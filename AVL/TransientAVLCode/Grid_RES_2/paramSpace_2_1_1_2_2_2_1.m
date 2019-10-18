function [aeroForces] = paramSpace_2_1_1_2_2_2_1(sailStates,airStates)

	CL = (5.978985)*sailStates.alpha + (-1.911579)*sailStates.beta + (-3.700671)*sailStates.p + (50.717930)*sailStates.q + (2.214220)*sailStates.r + (0.012850)*sailStates.de;
	CD = -5.867230;
	CY = (1.964436)*sailStates.alpha + (-0.121602)*sailStates.beta + (0.277003)*sailStates.p + (15.461112)*sailStates.q + (-0.030993)*sailStates.r + (0.003274)*sailStates.de;

	Cl = (-4.933259)*sailStates.alpha + (-1.030246)*sailStates.beta + (-1.878686)*sailStates.p + (16.260187)*sailStates.q + (2.411601)*sailStates.r + (0.001628)*sailStates.de;
	Cm = (2.719727)*sailStates.alpha + (8.413355)*sailStates.beta + (11.604858)*sailStates.p + (-164.944168)*sailStates.q + (-7.777744)*sailStates.r + (-0.068288)*sailStates.de;
	Cn = (-2.218416)*sailStates.alpha + (0.203697)*sailStates.beta + (-0.832607)*sailStates.p + (-8.967262)*sailStates.q + (-0.187403)*sailStates.r + (-0.004247)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end