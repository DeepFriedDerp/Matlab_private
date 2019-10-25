function [aeroForces] = paramSpace_1_4_1_2_3_2_3(sailStates,airStates)

	CL = (3.800089)*sailStates.alpha + (0.283315)*sailStates.beta + (-2.825210)*sailStates.p + (38.513596)*sailStates.q + (-1.341738)*sailStates.r + (0.010533)*sailStates.de;
	CD = 0.065050;
	CY = (0.066650)*sailStates.alpha + (-0.021092)*sailStates.beta + (-0.409660)*sailStates.p + (1.057312)*sailStates.q + (-0.081600)*sailStates.r + (0.000224)*sailStates.de;

	Cl = (1.351982)*sailStates.alpha + (0.251690)*sailStates.beta + (-1.410623)*sailStates.p + (12.342957)*sailStates.q + (-0.984704)*sailStates.r + (0.000660)*sailStates.de;
	Cm = (-13.064565)*sailStates.alpha + (-1.094841)*sailStates.beta + (9.086017)*sailStates.p + (-143.598221)*sailStates.q + (4.510277)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (0.196685)*sailStates.alpha + (0.031826)*sailStates.beta + (0.638279)*sailStates.p + (-2.609954)*sailStates.q + (-0.013199)*sailStates.r + (-0.000334)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end