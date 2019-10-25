function [aeroForces] = paramSpace_2_1_4_3_1_1_3(sailStates,airStates)

	CL = (4.109374)*sailStates.alpha + (-0.175308)*sailStates.beta + (-2.829808)*sailStates.p + (37.539848)*sailStates.q + (-0.873802)*sailStates.r + (0.011204)*sailStates.de;
	CD = -0.127120;
	CY = (-0.085926)*sailStates.alpha + (-0.024461)*sailStates.beta + (-0.290989)*sailStates.p + (-0.432841)*sailStates.q + (-0.019118)*sailStates.r + (-0.000093)*sailStates.de;

	Cl = (1.389858)*sailStates.alpha + (0.103971)*sailStates.beta + (-1.468982)*sailStates.p + (12.485430)*sailStates.q + (-0.726158)*sailStates.r + (0.000822)*sailStates.de;
	Cm = (-14.054915)*sailStates.alpha + (0.596501)*sailStates.beta + (9.476152)*sailStates.p + (-143.531296)*sailStates.q + (2.934189)*sailStates.r + (-0.069765)*sailStates.de;
	Cn = (0.171951)*sailStates.alpha + (0.010605)*sailStates.beta + (0.599403)*sailStates.p + (-2.218089)*sailStates.q + (-0.002185)*sailStates.r + (0.000048)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end