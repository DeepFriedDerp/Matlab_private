function [aeroForces] = paramSpace_2_3_2_2_2_1_1(sailStates,airStates)

	CL = (4.535733)*sailStates.alpha + (0.103083)*sailStates.beta + (-2.190684)*sailStates.p + (32.926273)*sailStates.q + (-1.293947)*sailStates.r + (0.011080)*sailStates.de;
	CD = -0.475700;
	CY = (0.077827)*sailStates.alpha + (-0.025016)*sailStates.beta + (-0.543573)*sailStates.p + (-0.100923)*sailStates.q + (-0.035624)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.145963)*sailStates.alpha + (0.303098)*sailStates.beta + (-0.871432)*sailStates.p + (6.855025)*sailStates.q + (-1.140489)*sailStates.r + (-0.000226)*sailStates.de;
	Cm = (-13.989741)*sailStates.alpha + (-0.407485)*sailStates.beta + (7.188223)*sailStates.p + (-126.149185)*sailStates.q + (4.397468)*sailStates.r + (-0.068986)*sailStates.de;
	Cn = (-0.528277)*sailStates.alpha + (0.017624)*sailStates.beta + (1.172625)*sailStates.p + (-5.089082)*sailStates.q + (0.005801)*sailStates.r + (-0.000056)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end