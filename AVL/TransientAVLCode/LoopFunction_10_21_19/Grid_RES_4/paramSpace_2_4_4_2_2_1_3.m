function [aeroForces] = paramSpace_2_4_4_2_2_1_3(sailStates,airStates)

	CL = (4.449703)*sailStates.alpha + (0.278900)*sailStates.beta + (-2.976087)*sailStates.p + (39.144306)*sailStates.q + (-1.378842)*sailStates.r + (0.011362)*sailStates.de;
	CD = -0.457740;
	CY = (-0.078264)*sailStates.alpha + (-0.024710)*sailStates.beta + (-0.545751)*sailStates.p + (0.100923)*sailStates.q + (-0.035760)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.442482)*sailStates.alpha + (0.356455)*sailStates.beta + (-1.487081)*sailStates.p + (12.474433)*sailStates.q + (-1.174880)*sailStates.r + (0.000739)*sailStates.de;
	Cm = (-13.868105)*sailStates.alpha + (-0.992400)*sailStates.beta + (9.813800)*sailStates.p + (-147.195892)*sailStates.q + (4.637794)*sailStates.r + (-0.070159)*sailStates.de;
	Cn = (0.205680)*sailStates.alpha + (0.016425)*sailStates.beta + (1.153715)*sailStates.p + (-5.144546)*sailStates.q + (0.004744)*sailStates.r + (-0.000157)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end