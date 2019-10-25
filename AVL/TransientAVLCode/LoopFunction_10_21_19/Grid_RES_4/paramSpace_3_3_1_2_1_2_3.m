function [aeroForces] = paramSpace_3_3_1_2_1_2_3(sailStates,airStates)

	CL = (4.055383)*sailStates.alpha + (-0.024038)*sailStates.beta + (-2.961543)*sailStates.p + (38.245087)*sailStates.q + (0.573206)*sailStates.r + (0.011287)*sailStates.de;
	CD = 0.013680;
	CY = (-0.077410)*sailStates.alpha + (-0.024758)*sailStates.beta + (0.193717)*sailStates.p + (-0.870359)*sailStates.q + (-0.012605)*sailStates.r + (-0.000189)*sailStates.de;

	Cl = (1.404076)*sailStates.alpha + (-0.074215)*sailStates.beta + (-1.515653)*sailStates.p + (12.645840)*sailStates.q + (0.398445)*sailStates.r + (0.000817)*sailStates.de;
	Cm = (-14.592618)*sailStates.alpha + (0.055062)*sailStates.beta + (10.016334)*sailStates.p + (-147.878265)*sailStates.q + (-1.896397)*sailStates.r + (-0.071191)*sailStates.de;
	Cn = (-0.018936)*sailStates.alpha + (0.003932)*sailStates.beta + (-0.336862)*sailStates.p + (1.982827)*sailStates.q + (0.002052)*sailStates.r + (0.000303)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end