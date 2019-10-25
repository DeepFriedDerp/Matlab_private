function [aeroForces] = paramSpace_1_1_1_2_2_1_3(sailStates,airStates)

	CL = (4.334445)*sailStates.alpha + (-0.494285)*sailStates.beta + (-2.924678)*sailStates.p + (41.991405)*sailStates.q + (-2.171141)*sailStates.r + (0.011250)*sailStates.de;
	CD = -0.487570;
	CY = (-0.089646)*sailStates.alpha + (-0.025838)*sailStates.beta + (-0.758202)*sailStates.p + (0.301043)*sailStates.q + (-0.150848)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.545334)*sailStates.alpha + (0.215549)*sailStates.beta + (-1.543290)*sailStates.p + (14.442519)*sailStates.q + (-1.793191)*sailStates.r + (0.000968)*sailStates.de;
	Cm = (-11.660128)*sailStates.alpha + (1.913600)*sailStates.beta + (8.676125)*sailStates.p + (-144.677322)*sailStates.q + (7.247664)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (0.543779)*sailStates.alpha + (0.072857)*sailStates.beta + (1.432435)*sailStates.p + (-5.434356)*sailStates.q + (-0.010968)*sailStates.r + (-0.000197)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end