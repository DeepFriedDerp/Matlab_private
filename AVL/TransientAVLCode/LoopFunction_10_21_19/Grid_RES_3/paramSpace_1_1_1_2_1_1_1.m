function [aeroForces] = paramSpace_1_1_1_2_1_1_1(sailStates,airStates)

	CL = (4.185184)*sailStates.alpha + (-0.356479)*sailStates.beta + (-2.183202)*sailStates.p + (34.864010)*sailStates.q + (-1.570447)*sailStates.r + (0.010953)*sailStates.de;
	CD = -0.360980;
	CY = (-0.045903)*sailStates.alpha + (-0.021989)*sailStates.beta + (-0.522885)*sailStates.p + (-1.027326)*sailStates.q + (-0.092101)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (1.030823)*sailStates.alpha + (0.212334)*sailStates.beta + (-0.922485)*sailStates.p + (8.106120)*sailStates.q + (-1.312249)*sailStates.r + (-0.000021)*sailStates.de;
	Cm = (-11.892502)*sailStates.alpha + (1.414855)*sailStates.beta + (6.613053)*sailStates.p + (-124.672379)*sailStates.q + (5.282032)*sailStates.r + (-0.066497)*sailStates.de;
	Cn = (-0.261370)*sailStates.alpha + (0.051664)*sailStates.beta + (1.074431)*sailStates.p + (-3.534713)*sailStates.q + (-0.013647)*sailStates.r + (0.000220)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end