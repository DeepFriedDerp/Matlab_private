function [aeroForces] = paramSpace_4_3_3_2_1_2_2(sailStates,airStates)

	CL = (3.965226)*sailStates.alpha + (-0.081227)*sailStates.beta + (-2.457484)*sailStates.p + (35.430954)*sailStates.q + (1.184217)*sailStates.r + (0.010587)*sailStates.de;
	CD = 0.041680;
	CY = (-0.098266)*sailStates.alpha + (-0.024146)*sailStates.beta + (0.349081)*sailStates.p + (-0.756270)*sailStates.q + (-0.069464)*sailStates.r + (-0.000160)*sailStates.de;

	Cl = (1.274905)*sailStates.alpha + (-0.169772)*sailStates.beta + (-1.133251)*sailStates.p + (9.748845)*sailStates.q + (0.844857)*sailStates.r + (0.000239)*sailStates.de;
	Cm = (-13.642975)*sailStates.alpha + (0.299376)*sailStates.beta + (7.907710)*sailStates.p + (-133.768066)*sailStates.q + (-3.963532)*sailStates.r + (-0.067580)*sailStates.de;
	Cn = (0.024232)*sailStates.alpha + (0.028564)*sailStates.beta + (-0.576013)*sailStates.p + (2.446684)*sailStates.q + (-0.008625)*sailStates.r + (0.000253)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end