function [aeroForces] = paramSpace_2_3_3_2_2_1_2(sailStates,airStates)

	CL = (4.594206)*sailStates.alpha + (0.098274)*sailStates.beta + (-2.593115)*sailStates.p + (36.168377)*sailStates.q + (-1.338269)*sailStates.r + (0.011299)*sailStates.de;
	CD = -0.470400;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.544972)*sailStates.p + (-0.000000)*sailStates.q + (-0.035719)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.380371)*sailStates.alpha + (0.301256)*sailStates.beta + (-1.200104)*sailStates.p + (9.903131)*sailStates.q + (-1.159828)*sailStates.r + (0.000300)*sailStates.de;
	Cm = (-14.262424)*sailStates.alpha + (-0.369990)*sailStates.beta + (8.534091)*sailStates.p + (-137.194580)*sailStates.q + (4.525622)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (-0.146292)*sailStates.alpha + (0.017446)*sailStates.beta + (1.162516)*sailStates.p + (-5.104352)*sailStates.q + (0.005314)*sailStates.r + (-0.000104)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end