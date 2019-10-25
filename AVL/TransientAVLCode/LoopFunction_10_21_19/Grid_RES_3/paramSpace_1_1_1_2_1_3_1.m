function [aeroForces] = paramSpace_1_1_1_2_1_3_1(sailStates,airStates)

	CL = (4.230162)*sailStates.alpha + (0.065629)*sailStates.beta + (-2.045254)*sailStates.p + (28.451212)*sailStates.q + (0.468955)*sailStates.r + (0.009692)*sailStates.de;
	CD = -0.420670;
	CY = (-0.188636)*sailStates.alpha + (-0.021989)*sailStates.beta + (0.418333)*sailStates.p + (-1.027328)*sailStates.q + (0.073861)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (1.249202)*sailStates.alpha + (-0.136823)*sailStates.beta + (-0.878830)*sailStates.p + (6.413011)*sailStates.q + (0.582697)*sailStates.r + (-0.000021)*sailStates.de;
	Cm = (-15.096336)*sailStates.alpha + (-0.205753)*sailStates.beta + (7.803548)*sailStates.p + (-124.672379)*sailStates.q + (-1.469601)*sailStates.r + (-0.066497)*sailStates.de;
	Cn = (0.696017)*sailStates.alpha + (-0.038220)*sailStates.beta + (-1.060409)*sailStates.p + (6.067389)*sailStates.q + (-0.057224)*sailStates.r + (0.000385)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end