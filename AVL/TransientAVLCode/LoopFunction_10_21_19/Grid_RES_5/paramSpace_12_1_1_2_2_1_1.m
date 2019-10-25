function [aeroForces] = paramSpace_12_1_1_2_2_1_1(sailStates,airStates)

	CL = (4.118559)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.299579)*sailStates.p + (31.930347)*sailStates.q + (-0.009629)*sailStates.r + (0.010603)*sailStates.de;
	CD = -0.100950;
	CY = (0.080841)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.197513)*sailStates.p + (0.520428)*sailStates.q + (0.027703)*sailStates.r + (0.000111)*sailStates.de;

	Cl = (1.169076)*sailStates.alpha + (0.077878)*sailStates.beta + (-1.013067)*sailStates.p + (7.845357)*sailStates.q + (-0.187954)*sailStates.r + (0.000082)*sailStates.de;
	Cm = (-15.121656)*sailStates.alpha + (0.000000)*sailStates.beta + (8.173689)*sailStates.p + (-130.856766)*sailStates.q + (0.033277)*sailStates.r + (-0.068597)*sailStates.de;
	Cn = (-0.319469)*sailStates.alpha + (-0.010945)*sailStates.beta + (0.532242)*sailStates.p + (-3.042341)*sailStates.q + (-0.028604)*sailStates.r + (-0.000177)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end