function [aeroForces] = paramSpace_4_4_2_1_1_1_2(sailStates,airStates)

	CL = (5.050606)*sailStates.alpha + (0.269145)*sailStates.beta + (-2.242493)*sailStates.p + (27.331545)*sailStates.q + (-0.851119)*sailStates.r + (0.008951)*sailStates.de;
	CD = -1.553520;
	CY = (-0.182357)*sailStates.alpha + (-0.019662)*sailStates.beta + (-0.554676)*sailStates.p + (-1.664523)*sailStates.q + (0.110391)*sailStates.r + (-0.000349)*sailStates.de;

	Cl = (0.999619)*sailStates.alpha + (0.398391)*sailStates.beta + (-1.022869)*sailStates.p + (7.228858)*sailStates.q + (-1.087564)*sailStates.r + (0.000089)*sailStates.de;
	Cm = (-15.493464)*sailStates.alpha + (-1.133081)*sailStates.beta + (9.016615)*sailStates.p + (-131.445847)*sailStates.q + (2.761908)*sailStates.r + (-0.066427)*sailStates.de;
	Cn = (-0.341940)*sailStates.alpha + (-0.062149)*sailStates.beta + (1.485417)*sailStates.p + (-5.952898)*sailStates.q + (-0.038824)*sailStates.r + (0.000345)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end