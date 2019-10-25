function [aeroForces] = paramSpace_4_3_3_3_3_1_1(sailStates,airStates)

	CL = (3.960166)*sailStates.alpha + (-0.010418)*sailStates.beta + (-2.193685)*sailStates.p + (30.759499)*sailStates.q + (0.102900)*sailStates.r + (0.010014)*sailStates.de;
	CD = -0.108510;
	CY = (0.101427)*sailStates.alpha + (-0.025728)*sailStates.beta + (-0.182921)*sailStates.p + (0.684401)*sailStates.q + (0.036410)*sailStates.r + (0.000144)*sailStates.de;

	Cl = (1.089240)*sailStates.alpha + (0.063395)*sailStates.beta + (-0.934582)*sailStates.p + (7.087259)*sailStates.q + (-0.112910)*sailStates.r + (-0.000008)*sailStates.de;
	Cm = (-14.651797)*sailStates.alpha + (0.038823)*sailStates.beta + (7.957399)*sailStates.p + (-128.521423)*sailStates.q + (-0.423400)*sailStates.r + (-0.067070)*sailStates.de;
	Cn = (-0.395754)*sailStates.alpha + (-0.010147)*sailStates.beta + (0.554887)*sailStates.p + (-3.530777)*sailStates.q + (-0.050991)*sailStates.r + (-0.000245)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end