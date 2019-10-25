function [aeroForces] = paramSpace_1_2_2_2_1_2_1(sailStates,airStates)

	CL = (3.845443)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.131862)*sailStates.p + (31.838686)*sailStates.q + (-0.546184)*sailStates.r + (0.010568)*sailStates.de;
	CD = 0.057540;
	CY = (-0.121227)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.034397)*sailStates.p + (-1.027328)*sailStates.q + (-0.006065)*sailStates.r + (-0.000217)*sailStates.de;

	Cl = (0.966798)*sailStates.alpha + (0.058178)*sailStates.beta + (-0.866658)*sailStates.p + (6.793339)*sailStates.q + (-0.330543)*sailStates.r + (-0.000133)*sailStates.de;
	Cm = (-13.925768)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.275222)*sailStates.p + (-125.588745)*sailStates.q + (1.865640)*sailStates.r + (-0.067412)*sailStates.de;
	Cn = (0.185552)*sailStates.alpha + (0.010258)*sailStates.beta + (-0.012535)*sailStates.p + (1.183753)*sailStates.q + (-0.033548)*sailStates.r + (0.000295)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end