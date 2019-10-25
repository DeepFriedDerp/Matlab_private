function [aeroForces] = paramSpace_2_2_2_1_2_1_1(sailStates,airStates)

	CL = (6.198291)*sailStates.alpha + (-0.194670)*sailStates.beta + (-1.739857)*sailStates.p + (30.468557)*sailStates.q + (-2.443185)*sailStates.r + (0.011161)*sailStates.de;
	CD = -2.330720;
	CY = (0.373663)*sailStates.alpha + (-0.024889)*sailStates.beta + (-1.097076)*sailStates.p + (-0.221991)*sailStates.q + (-0.071898)*sailStates.r + (-0.000047)*sailStates.de;

	Cl = (1.291156)*sailStates.alpha + (0.504973)*sailStates.beta + (-0.519949)*sailStates.p + (3.984602)*sailStates.q + (-2.225557)*sailStates.r + (-0.000761)*sailStates.de;
	Cm = (-12.500922)*sailStates.alpha + (0.768202)*sailStates.beta + (5.308177)*sailStates.p + (-112.898659)*sailStates.q + (8.294332)*sailStates.r + (-0.067809)*sailStates.de;
	Cn = (-2.005378)*sailStates.alpha + (0.037607)*sailStates.beta + (2.443017)*sailStates.p + (-10.877458)*sailStates.q + (0.016415)*sailStates.r + (-0.000101)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end