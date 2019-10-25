function [aeroForces] = paramSpace_1_2_3_3_1_2_1(sailStates,airStates)

	CL = (3.920788)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.263559)*sailStates.p + (32.982311)*sailStates.q + (-0.653125)*sailStates.r + (0.010736)*sailStates.de;
	CD = 0.052510;
	CY = (-0.074957)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.072819)*sailStates.p + (-0.665001)*sailStates.q + (-0.012903)*sailStates.r + (-0.000141)*sailStates.de;

	Cl = (1.062479)*sailStates.alpha + (0.062942)*sailStates.beta + (-0.975784)*sailStates.p + (7.883032)*sailStates.q + (-0.395922)*sailStates.r + (0.000032)*sailStates.de;
	Cm = (-14.197871)*sailStates.alpha + (0.000000)*sailStates.beta + (7.653872)*sailStates.p + (-129.097870)*sailStates.q + (2.190620)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (0.143857)*sailStates.alpha + (0.011098)*sailStates.beta + (0.059393)*sailStates.p + (0.566715)*sailStates.q + (-0.029135)*sailStates.r + (0.000172)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end