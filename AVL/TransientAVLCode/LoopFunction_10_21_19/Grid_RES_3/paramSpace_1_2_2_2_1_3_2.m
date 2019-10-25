function [aeroForces] = paramSpace_1_2_2_2_1_3_2(sailStates,airStates)

	CL = (4.384862)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.453743)*sailStates.p + (31.924631)*sailStates.q + (0.334303)*sailStates.r + (0.010115)*sailStates.de;
	CD = -0.436980;
	CY = (-0.087698)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.393457)*sailStates.p + (-0.759370)*sailStates.q + (0.069377)*sailStates.r + (-0.000162)*sailStates.de;

	Cl = (1.406738)*sailStates.alpha + (-0.166438)*sailStates.beta + (-1.165317)*sailStates.p + (9.006317)*sailStates.q + (0.503141)*sailStates.r + (0.000381)*sailStates.de;
	Cm = (-15.514857)*sailStates.alpha + (0.000000)*sailStates.beta + (9.143064)*sailStates.p + (-136.489655)*sailStates.q + (-1.046991)*sailStates.r + (-0.068470)*sailStates.de;
	Cn = (0.427163)*sailStates.alpha + (-0.029347)*sailStates.beta + (-1.047606)*sailStates.p + (5.914322)*sailStates.q + (-0.059773)*sailStates.r + (0.000303)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end