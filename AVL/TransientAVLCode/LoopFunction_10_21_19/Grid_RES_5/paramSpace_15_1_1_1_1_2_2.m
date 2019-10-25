function [aeroForces] = paramSpace_15_1_1_1_1_2_2(sailStates,airStates)

	CL = (5.252339)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.998250)*sailStates.p + (45.506283)*sailStates.q + (2.997294)*sailStates.r + (0.011935)*sailStates.de;
	CD = -1.038870;
	CY = (0.022968)*sailStates.alpha + (-0.025000)*sailStates.beta + (1.063437)*sailStates.p + (-1.423511)*sailStates.q + (-0.264990)*sailStates.r + (-0.000301)*sailStates.de;

	Cl = (2.051298)*sailStates.alpha + (-0.475754)*sailStates.beta + (-1.550021)*sailStates.p + (15.440921)*sailStates.q + (2.407007)*sailStates.r + (0.000888)*sailStates.de;
	Cm = (-11.820105)*sailStates.alpha + (0.000000)*sailStates.beta + (7.904655)*sailStates.p + (-145.460434)*sailStates.q + (-9.780478)*sailStates.r + (-0.067604)*sailStates.de;
	Cn = (-0.714282)*sailStates.alpha + (0.118619)*sailStates.beta + (-2.083556)*sailStates.p + (9.128776)*sailStates.q + (0.015229)*sailStates.r + (0.000612)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end