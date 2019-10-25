function [aeroForces] = paramSpace_2_2_4_3_2_2_1(sailStates,airStates)

	CL = (4.048695)*sailStates.alpha + (-0.010893)*sailStates.beta + (-2.306759)*sailStates.p + (32.835835)*sailStates.q + (-0.286822)*sailStates.r + (0.010963)*sailStates.de;
	CD = 0.030920;
	CY = (-0.003552)*sailStates.alpha + (-0.024960)*sailStates.beta + (-0.042701)*sailStates.p + (-0.065300)*sailStates.q + (-0.002806)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.145021)*sailStates.alpha + (0.017958)*sailStates.beta + (-1.011951)*sailStates.p + (8.014708)*sailStates.q + (-0.166232)*sailStates.r + (0.000046)*sailStates.de;
	Cm = (-14.737618)*sailStates.alpha + (0.010663)*sailStates.beta + (7.892602)*sailStates.p + (-130.047943)*sailStates.q + (0.943953)*sailStates.r + (-0.069357)*sailStates.de;
	Cn = (0.019854)*sailStates.alpha + (0.001460)*sailStates.beta + (0.059996)*sailStates.p + (-0.184130)*sailStates.q + (-0.002884)*sailStates.r + (-0.000000)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end