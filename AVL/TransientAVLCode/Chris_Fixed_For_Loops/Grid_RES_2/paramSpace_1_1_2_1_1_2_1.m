function [aeroForces] = paramSpace_1_1_2_1_1_2_1(sailStates,airStates)

	CL = (5.407834)*sailStates.alpha + (0.651918)*sailStates.beta + (-5.465567)*sailStates.p + (51.698982)*sailStates.q + (2.141495)*sailStates.r + (0.010758)*sailStates.de;
	CD = -6.068310;
	CY = (2.023680)*sailStates.alpha + (-0.030921)*sailStates.beta + (1.240069)*sailStates.p + (3.196492)*sailStates.q + (0.163485)*sailStates.r + (0.000719)*sailStates.de;

	Cl = (-0.083895)*sailStates.alpha + (-0.623677)*sailStates.beta + (-3.755292)*sailStates.p + (32.436676)*sailStates.q + (2.310711)*sailStates.r + (0.004823)*sailStates.de;
	Cm = (0.162138)*sailStates.alpha + (-2.715786)*sailStates.beta + (20.421185)*sailStates.p + (-222.036789)*sailStates.q + (-7.224308)*sailStates.r + (-0.079529)*sailStates.de;
	Cn = (-7.459905)*sailStates.alpha + (-0.109303)*sailStates.beta + (-3.365355)*sailStates.p + (14.894861)*sailStates.q + (-0.074360)*sailStates.r + (-0.000520)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end