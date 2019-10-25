function [aeroForces] = paramSpace_4_1_4_1_2_2_1(sailStates,airStates)

	CL = (4.315776)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.937803)*sailStates.p + (27.781256)*sailStates.q + (0.484122)*sailStates.r + (0.010091)*sailStates.de;
	CD = -0.523540;
	CY = (0.007168)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.351212)*sailStates.p + (0.696926)*sailStates.q + (0.049434)*sailStates.r + (0.000148)*sailStates.de;

	Cl = (0.870083)*sailStates.alpha + (-0.203565)*sailStates.beta + (-0.743310)*sailStates.p + (5.145401)*sailStates.q + (0.661453)*sailStates.r + (-0.000363)*sailStates.de;
	Cm = (-15.118559)*sailStates.alpha + (0.000000)*sailStates.beta + (7.230030)*sailStates.p + (-121.395615)*sailStates.q + (-1.636020)*sailStates.r + (-0.067712)*sailStates.de;
	Cn = (0.497463)*sailStates.alpha + (-0.028609)*sailStates.beta + (-0.880878)*sailStates.p + (3.539711)*sailStates.q + (-0.016604)*sailStates.r + (-0.000139)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end