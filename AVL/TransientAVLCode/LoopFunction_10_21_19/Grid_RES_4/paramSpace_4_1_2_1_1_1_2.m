function [aeroForces] = paramSpace_4_1_2_1_1_1_2(sailStates,airStates)

	CL = (5.050606)*sailStates.alpha + (-0.269145)*sailStates.beta + (-2.242493)*sailStates.p + (27.331545)*sailStates.q + (-0.851119)*sailStates.r + (0.008951)*sailStates.de;
	CD = -1.553520;
	CY = (-0.182357)*sailStates.alpha + (-0.029911)*sailStates.beta + (-0.554676)*sailStates.p + (-1.664523)*sailStates.q + (0.110391)*sailStates.r + (-0.000349)*sailStates.de;

	Cl = (1.165428)*sailStates.alpha + (0.286328)*sailStates.beta + (-1.117258)*sailStates.p + (8.416739)*sailStates.q + (-1.068831)*sailStates.r + (0.000343)*sailStates.de;
	Cm = (-15.493464)*sailStates.alpha + (1.133081)*sailStates.beta + (9.016615)*sailStates.p + (-131.445847)*sailStates.q + (2.761909)*sailStates.r + (-0.066427)*sailStates.de;
	Cn = (-0.281710)*sailStates.alpha + (-0.074050)*sailStates.beta + (1.504193)*sailStates.p + (-6.189182)*sailStates.q + (-0.042551)*sailStates.r + (0.000345)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end