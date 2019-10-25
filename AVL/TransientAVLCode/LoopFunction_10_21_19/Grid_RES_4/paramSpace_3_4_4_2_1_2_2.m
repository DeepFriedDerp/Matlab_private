function [aeroForces] = paramSpace_3_4_4_2_1_2_2(sailStates,airStates)

	CL = (4.026022)*sailStates.alpha + (-0.129049)*sailStates.beta + (-2.539022)*sailStates.p + (34.770031)*sailStates.q + (0.544922)*sailStates.r + (0.010827)*sailStates.de;
	CD = 0.024500;
	CY = (-0.096229)*sailStates.alpha + (-0.023721)*sailStates.beta + (0.221710)*sailStates.p + (-0.769434)*sailStates.q + (-0.014613)*sailStates.r + (-0.000165)*sailStates.de;

	Cl = (1.215090)*sailStates.alpha + (-0.113743)*sailStates.beta + (-1.145000)*sailStates.p + (9.122410)*sailStates.q + (0.423521)*sailStates.r + (0.000192)*sailStates.de;
	Cm = (-14.428576)*sailStates.alpha + (0.550183)*sailStates.beta + (8.596727)*sailStates.p + (-135.788696)*sailStates.q + (-1.867830)*sailStates.r + (-0.068965)*sailStates.de;
	Cn = (0.101289)*sailStates.alpha + (0.004091)*sailStates.beta + (-0.392592)*sailStates.p + (2.015010)*sailStates.q + (0.002740)*sailStates.r + (0.000233)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end