function [aeroForces] = paramSpace_12_1_1_1_1_2_1(sailStates,airStates)

	CL = (5.250683)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.079067)*sailStates.p + (34.308090)*sailStates.q + (2.094066)*sailStates.r + (0.011386)*sailStates.de;
	CD = -0.988450;
	CY = (-0.278586)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.850672)*sailStates.p + (-0.696925)*sailStates.q + (-0.119480)*sailStates.r + (-0.000148)*sailStates.de;

	Cl = (1.536167)*sailStates.alpha + (-0.397376)*sailStates.beta + (-0.787983)*sailStates.p + (6.868619)*sailStates.q + (1.741482)*sailStates.r + (-0.000363)*sailStates.de;
	Cm = (-13.267249)*sailStates.alpha + (0.000000)*sailStates.beta + (6.018363)*sailStates.p + (-121.395615)*sailStates.q + (-6.985440)*sailStates.r + (-0.067712)*sailStates.de;
	Cn = (1.030788)*sailStates.alpha + (0.055848)*sailStates.beta + (-1.833625)*sailStates.p + (8.721628)*sailStates.q + (0.028179)*sailStates.r + (0.000342)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end