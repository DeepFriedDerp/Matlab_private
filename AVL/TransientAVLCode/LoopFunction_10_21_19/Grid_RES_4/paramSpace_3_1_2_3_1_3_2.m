function [aeroForces] = paramSpace_3_1_2_3_1_3_2(sailStates,airStates)

	CL = (4.349910)*sailStates.alpha + (0.228537)*sailStates.beta + (-2.559261)*sailStates.p + (35.503025)*sailStates.q + (1.109266)*sailStates.r + (0.011044)*sailStates.de;
	CD = -0.243740;
	CY = (-0.063227)*sailStates.alpha + (-0.025265)*sailStates.beta + (0.456475)*sailStates.p + (-0.498142)*sailStates.q + (-0.029901)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.471626)*sailStates.alpha + (-0.133620)*sailStates.beta + (-1.250019)*sailStates.p + (10.530896)*sailStates.q + (0.935046)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-14.346081)*sailStates.alpha + (-0.841088)*sailStates.beta + (8.489475)*sailStates.p + (-135.916275)*sailStates.q + (-3.742810)*sailStates.r + (-0.068978)*sailStates.de;
	Cn = (0.124205)*sailStates.alpha + (0.014761)*sailStates.beta + (-0.944552)*sailStates.p + (4.449152)*sailStates.q + (0.005945)*sailStates.r + (0.000226)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end