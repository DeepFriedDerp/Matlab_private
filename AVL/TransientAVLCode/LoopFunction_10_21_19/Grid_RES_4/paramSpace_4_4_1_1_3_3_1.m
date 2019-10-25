function [aeroForces] = paramSpace_4_4_1_1_3_3_1(sailStates,airStates)

	CL = (5.286242)*sailStates.alpha + (-0.588902)*sailStates.beta + (-1.828977)*sailStates.p + (35.335526)*sailStates.q + (2.450659)*sailStates.r + (0.011762)*sailStates.de;
	CD = -1.779220;
	CY = (0.000266)*sailStates.alpha + (-0.031466)*sailStates.beta + (0.861018)*sailStates.p + (2.326707)*sailStates.q + (-0.171517)*sailStates.r + (0.000482)*sailStates.de;

	Cl = (0.465960)*sailStates.alpha + (-0.667301)*sailStates.beta + (-0.492230)*sailStates.p + (4.504582)*sailStates.q + (2.086982)*sailStates.r + (-0.000791)*sailStates.de;
	Cm = (-8.666201)*sailStates.alpha + (2.185129)*sailStates.beta + (4.466814)*sailStates.p + (-112.315697)*sailStates.q + (-8.114443)*sailStates.r + (-0.064697)*sailStates.de;
	Cn = (1.456999)*sailStates.alpha + (0.101282)*sailStates.beta + (-1.993206)*sailStates.p + (7.344604)*sailStates.q + (0.001016)*sailStates.r + (-0.000509)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end