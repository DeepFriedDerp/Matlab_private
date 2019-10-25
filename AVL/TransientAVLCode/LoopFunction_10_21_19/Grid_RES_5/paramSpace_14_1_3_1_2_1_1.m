function [aeroForces] = paramSpace_14_1_3_1_2_1_1(sailStates,airStates)

	CL = (4.534723)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.906146)*sailStates.p + (26.147060)*sailStates.q + (-0.701641)*sailStates.r + (0.009364)*sailStates.de;
	CD = -0.752020;
	CY = (0.273479)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.566857)*sailStates.p + (1.364607)*sailStates.q + (0.120538)*sailStates.r + (0.000286)*sailStates.de;

	Cl = (1.236720)*sailStates.alpha + (0.229368)*sailStates.beta + (-0.741446)*sailStates.p + (4.706767)*sailStates.q + (-0.845148)*sailStates.r + (-0.000242)*sailStates.de;
	Cm = (-15.935290)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.769774)*sailStates.p + (-122.335159)*sailStates.q + (2.193829)*sailStates.r + (-0.066282)*sailStates.de;
	Cn = (-1.014691)*sailStates.alpha + (-0.048754)*sailStates.beta + (1.383886)*sailStates.p + (-7.615235)*sailStates.q + (-0.081095)*sailStates.r + (-0.000497)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end