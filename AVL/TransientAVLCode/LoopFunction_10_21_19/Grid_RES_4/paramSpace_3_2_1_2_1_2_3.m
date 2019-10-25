function [aeroForces] = paramSpace_3_2_1_2_1_2_3(sailStates,airStates)

	CL = (4.055383)*sailStates.alpha + (0.024038)*sailStates.beta + (-2.961543)*sailStates.p + (38.245087)*sailStates.q + (0.573206)*sailStates.r + (0.011287)*sailStates.de;
	CD = 0.013680;
	CY = (-0.077410)*sailStates.alpha + (-0.025194)*sailStates.beta + (0.193717)*sailStates.p + (-0.870359)*sailStates.q + (-0.012605)*sailStates.r + (-0.000189)*sailStates.de;

	Cl = (1.448851)*sailStates.alpha + (-0.048921)*sailStates.beta + (-1.548305)*sailStates.p + (13.049722)*sailStates.q + (0.400543)*sailStates.r + (0.000905)*sailStates.de;
	Cm = (-14.592616)*sailStates.alpha + (-0.055062)*sailStates.beta + (10.016334)*sailStates.p + (-147.878265)*sailStates.q + (-1.896396)*sailStates.r + (-0.071191)*sailStates.de;
	Cn = (-0.027275)*sailStates.alpha + (0.004139)*sailStates.beta + (-0.334722)*sailStates.p + (1.956355)*sailStates.q + (0.001915)*sailStates.r + (0.000303)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end