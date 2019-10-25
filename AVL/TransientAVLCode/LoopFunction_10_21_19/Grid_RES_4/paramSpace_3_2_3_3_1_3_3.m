function [aeroForces] = paramSpace_3_2_3_3_1_3_3(sailStates,airStates)

	CL = (4.376069)*sailStates.alpha + (0.085359)*sailStates.beta + (-2.838772)*sailStates.p + (37.894123)*sailStates.q + (1.154891)*sailStates.r + (0.011311)*sailStates.de;
	CD = -0.249970;
	CY = (-0.019950)*sailStates.alpha + (-0.025197)*sailStates.beta + (0.482553)*sailStates.p + (-0.563441)*sailStates.q + (-0.031648)*sailStates.r + (-0.000122)*sailStates.de;

	Cl = (1.537185)*sailStates.alpha + (-0.192704)*sailStates.beta + (-1.439147)*sailStates.p + (12.176475)*sailStates.q + (0.986562)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.398703)*sailStates.alpha + (-0.332851)*sailStates.beta + (9.421483)*sailStates.p + (-144.107025)*sailStates.q + (-3.917397)*sailStates.r + (-0.070783)*sailStates.de;
	Cn = (-0.061682)*sailStates.alpha + (0.014775)*sailStates.beta + (-0.977257)*sailStates.p + (4.506201)*sailStates.q + (0.005562)*sailStates.r + (0.000242)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end