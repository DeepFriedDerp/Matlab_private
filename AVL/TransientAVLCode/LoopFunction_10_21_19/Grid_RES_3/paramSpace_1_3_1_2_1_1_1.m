function [aeroForces] = paramSpace_1_3_1_2_1_1_1(sailStates,airStates)

	CL = (4.185183)*sailStates.alpha + (0.356479)*sailStates.beta + (-2.183202)*sailStates.p + (34.864010)*sailStates.q + (-1.570448)*sailStates.r + (0.010953)*sailStates.de;
	CD = -0.360980;
	CY = (-0.045903)*sailStates.alpha + (-0.027673)*sailStates.beta + (-0.522885)*sailStates.p + (-1.027326)*sailStates.q + (-0.092101)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (0.901088)*sailStates.alpha + (0.385469)*sailStates.beta + (-0.837867)*sailStates.p + (7.045254)*sailStates.q + (-1.297228)*sailStates.r + (-0.000247)*sailStates.de;
	Cm = (-11.892502)*sailStates.alpha + (-1.414855)*sailStates.beta + (6.613054)*sailStates.p + (-124.672363)*sailStates.q + (5.282031)*sailStates.r + (-0.066497)*sailStates.de;
	Cn = (-0.356646)*sailStates.alpha + (0.053745)*sailStates.beta + (1.089352)*sailStates.p + (-3.721772)*sailStates.q + (-0.010998)*sailStates.r + (0.000220)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end