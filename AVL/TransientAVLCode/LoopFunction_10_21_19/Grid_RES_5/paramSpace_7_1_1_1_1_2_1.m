function [aeroForces] = paramSpace_7_1_1_1_1_2_1(sailStates,airStates)

	CL = (5.020950)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.052202)*sailStates.p + (30.010489)*sailStates.q + (1.381516)*sailStates.r + (0.010676)*sailStates.de;
	CD = -0.890460;
	CY = (-0.278480)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.713158)*sailStates.p + (-1.046671)*sailStates.q + (0.025014)*sailStates.r + (-0.000224)*sailStates.de;

	Cl = (1.423996)*sailStates.alpha + (-0.314212)*sailStates.beta + (-0.792741)*sailStates.p + (5.693686)*sailStates.q + (1.279173)*sailStates.r + (-0.000312)*sailStates.de;
	Cm = (-15.378645)*sailStates.alpha + (0.000000)*sailStates.beta + (7.313368)*sailStates.p + (-123.745377)*sailStates.q + (-4.653934)*sailStates.r + (-0.069078)*sailStates.de;
	Cn = (1.035853)*sailStates.alpha + (-0.010973)*sailStates.beta + (-1.605529)*sailStates.p + (8.257753)*sailStates.q + (-0.010806)*sailStates.r + (0.000435)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end