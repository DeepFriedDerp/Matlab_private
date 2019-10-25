function [aeroForces] = paramSpace_1_2_3_1_1_2_2(sailStates,airStates)

	CL = (3.943684)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.547681)*sailStates.p + (34.939266)*sailStates.q + (-0.439041)*sailStates.r + (0.010864)*sailStates.de;
	CD = 0.033040;
	CY = (-0.203531)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.087879)*sailStates.p + (-1.671348)*sailStates.q + (0.015336)*sailStates.r + (-0.000356)*sailStates.de;

	Cl = (1.206999)*sailStates.alpha + (0.022744)*sailStates.beta + (-1.202541)*sailStates.p + (9.807924)*sailStates.q + (-0.220416)*sailStates.r + (0.000436)*sailStates.de;
	Cm = (-14.460464)*sailStates.alpha + (0.000000)*sailStates.beta + (8.837562)*sailStates.p + (-137.643188)*sailStates.q + (1.498338)*sailStates.r + (-0.068587)*sailStates.de;
	Cn = (0.380153)*sailStates.alpha + (0.004010)*sailStates.beta + (-0.314473)*sailStates.p + (3.196805)*sailStates.q + (-0.056922)*sailStates.r + (0.000482)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end